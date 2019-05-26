// Assignment 3, Part 1 and 2
//
// Modify this file according to the lab instructions.
//Parker Eischen
//export ASSIGNMENT3_ROOT=$HOME/Documents/GitHub/ComputerGraphics/assignment3

#include "utils.h"
#include "utils2.h"

#include <GL/glew.h>
#include <GLFW/glfw3.h>

#include <imgui.h>
#include <imgui_impl_glfw_gl3.h>

#define GLM_FORCE_RADIANS
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include <iostream>
#include <cstdlib>
#include <algorithm>


float shine = 40.0f;

// The attribute locations we will use in the vertex shader
enum AttributeLocation {
    POSITION = 0,
    NORMAL = 1
};

// Struct for representing an indexed triangle mesh
struct Mesh {
    std::vector<glm::vec3> vertices;
    std::vector<glm::vec3> normals;
    std::vector<uint32_t> indices;
};

// Struct for representing a vertex array object (VAO) created from a
// mesh. Used for rendering.
struct MeshVAO {
    GLuint vao;
    GLuint vertexVBO;
    GLuint normalVBO;
    GLuint indexVBO;
    int numVertices;
    int numIndices;
};

// Struct for resources and state
struct Context {
    int width;
    int height;
    float aspect;
    GLFWwindow *window;
    GLuint program;
    Trackball trackball;
    Mesh mesh;
    MeshVAO meshVAO;
    GLuint defaultVAO;
    GLuint cubemap[8];
    float elapsed_time;

    glm::vec3 diffuseColor = glm::vec3(0, 0, 0.5f);
    bool diffuseOn = true;
    glm::vec3 specularColor = glm::vec3(0.04f, 0.04f, 0.04f);
    bool specularOn = true;
    float specularPower = 40.0f;
    bool ambientOn = true;
    bool gammaOn = true;
    float zoomFactor;
    glm::vec3 lightPos = glm::vec3(10.0, 0.0, 0.0); // Position of the light
    glm::vec3 lightColor = glm::vec3(1.0f, 1.0f, 1.0f); //light color
    bool lightEnabled = true;
    float backgroundColor[3] = {0.2f, 0.2f, 0.2f};
    bool rgbSurfaceNormal = false;
    bool orthoToggle = false;

    int activeTexture;


};

// Returns the value of an environment variable
std::string getEnvVar(const std::string &name)
{
    char const* value = std::getenv(name.c_str());
    if (value == nullptr) {
        return std::string();
    }
    else {
        return std::string(value);
    }
}

// Returns the absolute path to the shader directory
std::string shaderDir(void)
{
    std::string rootDir = getEnvVar("ASSIGNMENT3_ROOT");
    if (rootDir.empty()) {
        std::cout << "Error: ASSIGNMENT3_ROOT is not set." << std::endl;
        std::exit(EXIT_FAILURE);
    }
    return rootDir + "/model_viewer/src/shaders/";
}

// Returns the absolute path to the 3D model directory
std::string modelDir(void)
{
    std::string rootDir = getEnvVar("ASSIGNMENT3_ROOT");
    if (rootDir.empty()) {
        std::cout << "Error: ASSIGNMENT3_ROOT is not set." << std::endl;
        std::exit(EXIT_FAILURE);
    }
    return rootDir + "/model_viewer/3d_models/";
}

// Returns the absolute path to the cubemap texture directory
std::string cubemapDir(void)
{
    std::string rootDir = getEnvVar("ASSIGNMENT3_ROOT");
    if (rootDir.empty()) {
        std::cout << "Error: ASSIGNMENT3_ROOT is not set." << std::endl;
        std::exit(EXIT_FAILURE);
    }
    return rootDir + "/model_viewer/cubemaps/";
}

void loadMesh(const std::string &filename, Mesh *mesh)
{
    OBJMesh obj_mesh;
    objMeshLoad(obj_mesh, filename);
    mesh->vertices = obj_mesh.vertices;
    mesh->normals = obj_mesh.normals;
    mesh->indices = obj_mesh.indices;
}

void createMeshVAO(Context &ctx, const Mesh &mesh, MeshVAO *meshVAO)
{
    // Generates and populates a VBO for the vertices
    glGenBuffers(1, &(meshVAO->vertexVBO));
    glBindBuffer(GL_ARRAY_BUFFER, meshVAO->vertexVBO);
    auto verticesNBytes = mesh.vertices.size() * sizeof(mesh.vertices[0]);
    glBufferData(GL_ARRAY_BUFFER, verticesNBytes, mesh.vertices.data(), GL_STATIC_DRAW);

    // Generates and populates a VBO for the vertex normals
    glGenBuffers(1, &(meshVAO->normalVBO));
    glBindBuffer(GL_ARRAY_BUFFER, meshVAO->normalVBO);
    auto normalsNBytes = mesh.normals.size() * sizeof(mesh.normals[0]);
    glBufferData(GL_ARRAY_BUFFER, normalsNBytes, mesh.normals.data(), GL_STATIC_DRAW);

    // Generates and populates a VBO for the element indices
    glGenBuffers(1, &(meshVAO->indexVBO));
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, meshVAO->indexVBO);
    auto indicesNBytes = mesh.indices.size() * sizeof(mesh.indices[0]);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, indicesNBytes, mesh.indices.data(), GL_STATIC_DRAW);

    // Creates a vertex array object (VAO) for drawing the mesh
    glGenVertexArrays(1, &(meshVAO->vao));
    glBindVertexArray(meshVAO->vao);
    glBindBuffer(GL_ARRAY_BUFFER, meshVAO->vertexVBO);
    glEnableVertexAttribArray(POSITION);
    glVertexAttribPointer(POSITION, 3, GL_FLOAT, GL_FALSE, 0, nullptr);
    glBindBuffer(GL_ARRAY_BUFFER, meshVAO->normalVBO);
    glEnableVertexAttribArray(NORMAL);
    glVertexAttribPointer(NORMAL, 3, GL_FLOAT, GL_FALSE, 0, nullptr);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, meshVAO->indexVBO);
    glBindVertexArray(ctx.defaultVAO); // unbinds the VAO

    // Additional information required by draw calls
    meshVAO->numVertices = mesh.vertices.size();
    meshVAO->numIndices = mesh.indices.size();
}

void initializeTrackball(Context &ctx)
{
    double radius = double(std::min(ctx.width, ctx.height)) / 2.0;
    ctx.trackball.radius = radius;
    glm::vec2 center = glm::vec2(ctx.width, ctx.height) / 2.0f;
    ctx.trackball.center = center;
}

void init(Context &ctx)
{
    ctx.program = loadShaderProgram(shaderDir() + "mesh.vert",
                                    shaderDir() + "mesh.frag");

    loadMesh((modelDir() + "gargo.obj"), &ctx.mesh);
    createMeshVAO(ctx, ctx.mesh, &ctx.meshVAO);
    //load cubemap textures
    std::string prefiltered_levels[8] = { "0.5", "0.125", "2", "8", "32", "128", "512", "2048" };
    std::string texture_name = "LarnacaCastle";

    for (int i = 0; i < 8; i++) {
        std::string path = cubemapDir() + "/" + texture_name + "/prefiltered/" + prefiltered_levels[i];
        ctx.cubemap[i] = loadCubemap(path);
    }
    ctx.activeTexture = 0;

    initializeTrackball(ctx);
}

// MODIFY THIS FUNCTION
void drawMesh(Context &ctx, GLuint program, const MeshVAO &meshVAO)
{
    // Define uniforms
    glm::mat4 rotation = trackballGetRotationMatrix(ctx.trackball);
    glm::mat4 view = glm::lookAt(
        glm::vec3(.0f, .0f, -5.0f), // Camera position
        glm::vec3(.0f, .0f, .0f), // Target position
        glm::vec3(0, 1, 0)
    );
    glm::mat4 model = rotation;
    glm::mat4 projection = glm::perspective(glm::radians(30.0f * ctx.zoomFactor), 1.0f, 0.01f, 100.0f);
    glm::mat4 mv = view * model;
    glm::mat4 mvp = projection * mv;



    if(ctx.orthoToggle ==true){//not working properly????
        projection = glm::ortho(0.0f, (float)ctx.width, 0.0f,(float)ctx.height, 1.f, 10000.0f);
        // mv = view * model;
        model = glm::mat4(
            glm::vec4(1.f, .0f, 0.f,0.f), 
            glm::vec4(.0f, 1.f, .0f,0.f), 
            glm::vec4(0.f, 0.f, 1.f,0.f),
            glm::vec4(0.f,0.f,0.f,1.f));

        model = glm::translate(model,glm::vec3( -250.0f, 250.0f, 0.0f));
        model = glm::scale(model, glm::vec3( 100.0f, 100.0f, 0.0f ));
        model = model * rotation;
        
        
        mv = view * model;
        mvp = projection * mv;
        
    }
    

    


    
    // ...
    //Light 
    glm::vec3 lightPos = ctx.lightPos; // Position of the light
    glm::vec3 lightColor = ctx.lightColor;

    glm::vec3 diffuseColor = ctx.diffuseColor; //Diffuse material color
    glm::vec3 specularColor = ctx.specularColor; //Specular material color
    glm::vec3 ambientColor = diffuseColor*.01f;//Ambient material color

    float specularPower = ctx.specularPower;//shine
    // Activate program
    glUseProgram(program);

    // Bind textures
    // ...
    if(ctx.lightEnabled == false)
    {
     lightColor = glm::vec3(0,0,0);   
    }
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_CUBE_MAP, ctx.cubemap[ctx.activeTexture]);
    glUniform1i(glGetUniformLocation(program, "u_cubemap"), 0);

    // Pass uniforms
    glUniform3fv(glGetUniformLocation(program,"u_lightColor"), 1, &lightColor[0]);

    glUniformMatrix4fv(glGetUniformLocation(program, "u_mv"), 1, GL_FALSE, &mv[0][0]);
    glUniformMatrix4fv(glGetUniformLocation(program, "u_mvp"), 1, GL_FALSE, &mvp[0][0]);
    glUniform1f(glGetUniformLocation(program, "u_time"), ctx.elapsed_time);
    // ...
    glUniform3fv(glGetUniformLocation(program,"u_lightPos"), 1, &lightPos[0]);
    glUniform3fv(glGetUniformLocation(program,"u_ambientColor"), 1, &ambientColor[0]);
    glUniform3fv(glGetUniformLocation(program,"u_diffuseColor"), 1, &diffuseColor[0]);
    glUniform3fv(glGetUniformLocation(program,"u_specularColor"), 1, &specularColor[0]);
    glUniform1f(glGetUniformLocation(program, "u_specularPower"), specularPower);

    glUniform1i(glGetUniformLocation(program,"u_specularOn"),ctx.specularOn);
    glUniform1i(glGetUniformLocation(program,"u_diffuseOn"),ctx.diffuseOn);
    glUniform1i(glGetUniformLocation(program,"u_gammaOn"),ctx.gammaOn);
    glUniform1i(glGetUniformLocation(program,"u_ambientOn"),ctx.ambientOn);
    glUniform1i(glGetUniformLocation(program,"u_rgbSurfaceNormal"),ctx.rgbSurfaceNormal);
    glUniformMatrix4fv(glGetUniformLocation(program, "u_m"), 1, GL_FALSE, &model[0][0]);

    // Draw!
    glBindVertexArray(meshVAO.vao);
    glDrawElements(GL_TRIANGLES, meshVAO.numIndices, GL_UNSIGNED_INT, 0);
    glBindVertexArray(ctx.defaultVAO);
}

void display(Context &ctx)
{
    float r = ctx.backgroundColor[0];
    float g = ctx.backgroundColor[1];
    float b = ctx.backgroundColor[2];
    glClearColor(r,g,b, 1.0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glEnable(GL_DEPTH_TEST); // ensures that polygons overlap correctly
    drawMesh(ctx, ctx.program, ctx.meshVAO);
}

void reloadShaders(Context *ctx)
{
    glDeleteProgram(ctx->program);
    ctx->program = loadShaderProgram(shaderDir() + "mesh.vert",
                                     shaderDir() + "mesh.frag");
}

void mouseButtonPressed(Context *ctx, int button, int x, int y)
{
    if (button == GLFW_MOUSE_BUTTON_LEFT) {
        ctx->trackball.center = glm::vec2(x, y);
        trackballStartTracking(ctx->trackball, glm::vec2(x, y));
    }
}

void mouseButtonReleased(Context *ctx, int button, int x, int y)
{
    if (button == GLFW_MOUSE_BUTTON_LEFT) {
        trackballStopTracking(ctx->trackball);
    }
}

void moveTrackball(Context *ctx, int x, int y)
{
    if (ctx->trackball.tracking) {
        trackballMove(ctx->trackball, glm::vec2(x, y));
    }
}

void errorCallback(int /*error*/, const char* description)
{
    std::cerr << description << std::endl;
}

void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    // Forward event to GUI
    ImGui_ImplGlfwGL3_KeyCallback(window, key, scancode, action, mods);
    if (ImGui::GetIO().WantCaptureKeyboard) { return; }  // Skip other handling

    Context *ctx = static_cast<Context *>(glfwGetWindowUserPointer(window));
    if (key == GLFW_KEY_R && action == GLFW_PRESS) {
        reloadShaders(ctx);
    }
}

void charCallback(GLFWwindow* window, unsigned int codepoint)
{
    // Forward event to GUI
    ImGui_ImplGlfwGL3_CharCallback(window, codepoint);
    if (ImGui::GetIO().WantTextInput) { return; }  // Skip other handling
}

void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods)
{
    // Forward event to GUI
    ImGui_ImplGlfwGL3_MouseButtonCallback(window, button, action, mods);
    if (ImGui::GetIO().WantCaptureMouse) { return; }  // Skip other handling

    double x, y;
    glfwGetCursorPos(window, &x, &y);

    Context *ctx = static_cast<Context *>(glfwGetWindowUserPointer(window));
    if (action == GLFW_PRESS) {
        mouseButtonPressed(ctx, button, x, y);
    }
    else {
        mouseButtonReleased(ctx, button, x, y);
    }
}

void cursorPosCallback(GLFWwindow* window, double x, double y)
{
    if (ImGui::GetIO().WantCaptureMouse) { return; }  // Skip other handling   

    Context *ctx = static_cast<Context *>(glfwGetWindowUserPointer(window));
    moveTrackball(ctx, x, y);
}

void resizeCallback(GLFWwindow* window, int width, int height)
{
    Context *ctx = static_cast<Context *>(glfwGetWindowUserPointer(window));
    ctx->width = width;
    ctx->height = height;
    ctx->aspect = float(width) / float(height);
    ctx->trackball.radius = double(std::min(width, height)) / 2.0;
    ctx->trackball.center = glm::vec2(width, height) / 2.0f;
    glViewport(0, 0, width, height);
}
void scrollCallback(GLFWwindow* window, double x, double y) {
    if (ImGui::GetIO().WantCaptureMouse) { return; }  // Skip other handling   

    Context *ctx = static_cast<Context *>(glfwGetWindowUserPointer(window));
    ctx->zoomFactor = ctx->zoomFactor + 0.1f*(float)y;
}

int main(void)
{
    Context ctx;

    // Create a GLFW window
    glfwSetErrorCallback(errorCallback);
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    ctx.width = 500;
    ctx.height = 500;
    ctx.aspect = float(ctx.width) / float(ctx.height);
    ctx.window = glfwCreateWindow(ctx.width, ctx.height, "Model viewer", nullptr, nullptr);
    ctx.zoomFactor = 1.0;
    glfwMakeContextCurrent(ctx.window);
    glfwSetWindowUserPointer(ctx.window, &ctx);
    glfwSetKeyCallback(ctx.window, keyCallback);
    glfwSetCharCallback(ctx.window, charCallback);
    glfwSetMouseButtonCallback(ctx.window, mouseButtonCallback);
    glfwSetCursorPosCallback(ctx.window, cursorPosCallback);
    glfwSetFramebufferSizeCallback(ctx.window, resizeCallback);
    glfwSetScrollCallback(ctx.window,scrollCallback);

    // Load OpenGL functions
    glewExperimental = true;
    GLenum status = glewInit();
    if (status != GLEW_OK) {
        std::cerr << "Error: " << glewGetErrorString(status) << std::endl;
        std::exit(EXIT_FAILURE);
    }
    std::cout << "OpenGL version: " << glGetString(GL_VERSION) << std::endl;

    // Initialize GUI
    ImGui_ImplGlfwGL3_Init(ctx.window, false /*do not install callbacks*/);

    // Initialize rendering
    glGenVertexArrays(1, &ctx.defaultVAO);
    glBindVertexArray(ctx.defaultVAO);
    glEnable(GL_TEXTURE_CUBE_MAP_SEAMLESS);
    init(ctx);

    // Start rendering loop
    while (!glfwWindowShouldClose(ctx.window)) {
        glfwPollEvents();
        ctx.elapsed_time = glfwGetTime();
        ImGui_ImplGlfwGL3_NewFrame();
        ImGui::ColorEdit3("Diffuse Color", &ctx.diffuseColor[0]);
        ImGui::Checkbox("Diffuse Toggle", &ctx.diffuseOn);
        ImGui::ColorEdit3("Specular Color", &ctx.specularColor[0]);
        ImGui::SliderFloat("Specular Power", &ctx.specularPower,0.0f,60.0f);
        ImGui::Checkbox("Specular Toggle", &ctx.specularOn);
        ImGui::SliderFloat3("Light Position", &ctx.lightPos[0],0.0f,15.0f);     
        ImGui::ColorEdit3("Light Color", &ctx.lightColor[0]);
        ImGui::Checkbox("Light Toggle", &ctx.lightEnabled);
        ImGui::Checkbox("Gamma Toggle", &ctx.gammaOn);
        ImGui::Checkbox("Ambient Toggle", &ctx.ambientOn);
        ImGui::ColorEdit3("Background Color", ctx.backgroundColor);
        ImGui::Checkbox("Normals", &ctx.rgbSurfaceNormal);
        ImGui::Checkbox("Perspective/Orthographic Toggle", &ctx.orthoToggle);
        ImGui::SliderInt("Texture Index", &ctx.activeTexture,0,7);


{
    // do stuff
}
        display(ctx);
        ImGui::Render();
        glfwSwapBuffers(ctx.window);
    }

    // Shutdown
    glfwDestroyWindow(ctx.window);
    glfwTerminate();
    std::exit(EXIT_SUCCESS);
}
