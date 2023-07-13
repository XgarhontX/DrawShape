#include "Reshade.fxh"
#include "ReShadeUI.fxh"

// ReShadeUI ///////////////////////////////////////////////////////////////////////////////////////
uniform int StartX <
    ui_type = "drag";
    ui_min = 0;
    ui_max = BUFFER_WIDTH;
    ui_label = "StartX";
> = BUFFER_WIDTH/4;

uniform int StartY <
    ui_type = "drag";
    ui_min = 0;
    ui_max = BUFFER_HEIGHT;
    ui_label = "StartY";
> = BUFFER_HEIGHT/4;

uniform int SizeX <
    ui_type = "drag";
    ui_min = 0;
    ui_max = BUFFER_WIDTH;
    ui_label = "SizeX";
> = BUFFER_WIDTH/2;

uniform int SizeY <
    ui_type = "drag";
    ui_min = 0;
    ui_max = BUFFER_HEIGHT;
    ui_label = "SizeY";
> = BUFFER_HEIGHT/2;

uniform float3 Color <
    ui_type = "color";
    ui_label = "Color";
> = float3(0.0, 0.0, 0.0);

uniform float Opacity <
    ui_type = "slider";
    ui_min = 0.0;
    ui_max = 1.0;
    ui_label = "Opacity";
> = 0.85;

// PixelShader /////////////////////////////////////////////////////////////////////////////////////
float4 PS_DrawRectangle(float4 pos : SV_Position, float2 texcoord : TEXCOORD) : SV_Target {
    //get orig pixel
	float4 orig = tex2D(ReShade::BackBuffer, texcoord);

    //if rectangle pixel
    if (pos.x >= StartX && pos.x <= StartX + SizeX &&
        pos.y >= StartY && pos.y <= StartY + SizeY) {
        //draw pixel w/ color
        float4 draw = float4(Color, 1.0);
        //blend orig with draw, via Opacity
        return lerp(orig, draw, Opacity);
    } else {
    	discard;
    }
}

// Technique ///////////////////////////////////////////////////////////////////////////////////////
technique DrawRectangle {
	pass Final {
		VertexShader = PostProcessVS; //default
		PixelShader = PS_DrawRectangle;
	}
}