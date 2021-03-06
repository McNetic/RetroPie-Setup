// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)


struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};

vec4 _oPosition1;
uniform mat4 MVPMatrix;
input_dummy _IN1;
vec4 _r0004;
attribute vec4 VertexCoord;
attribute vec4 COLOR;
varying vec4 COL0;
attribute vec4 TexCoord;
varying vec4 TEX0;

 

         mat4 transpose_(mat4 matrix)
         {
            mat4 ret;
            for (int i = 0; i != 4; i++)
               for (int j = 0; j != 4; j++)
                  ret[i][j] = matrix[j][i];

            return ret;
         }
         
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{
    mat4 MVPMatrix_ = transpose_(MVPMatrix);

    vec4 _oColor;
    vec2 _oTex;
    vec2 _scale;
    vec2 _middle;
    vec2 _diff;

    _r0004.x = dot(MVPMatrix_[0], VertexCoord);
    _r0004.y = dot(MVPMatrix_[1], VertexCoord);
    _r0004.z = dot(MVPMatrix_[2], VertexCoord);
    _r0004.w = dot(MVPMatrix_[3], VertexCoord);
    _oPosition1 = _r0004;
    _oColor = COLOR;
    _scale = OutputSize/InputSize;
    _middle = (5.00000000E-001*InputSize)/TextureSize;
    _diff = TexCoord.xy - _middle;
    _oTex = _middle + _diff*_scale;
    gl_Position = _r0004;
    COL0 = COLOR;
    TEX0.xy = _oTex;
} 
#elif defined(FRAGMENT)
#ifdef GL_ES
precision mediump float;
#endif


struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};

vec4 _ret_0;
uniform sampler2D Texture;
varying vec4 TEX0;

 
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{


    _ret_0 = texture2D(Texture, TEX0.xy);
    gl_FragColor = _ret_0;
    return;
} 
#endif
