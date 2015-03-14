// Collects cascaded shadows into screen space buffer ready for blurring
Shader "Hidden/Internal-PrePassCollectShadows" {
Properties {
	_ShadowMapTexture ("", any) = "" {}
}
SubShader {
Pass {
	ZWrite Off ZTest Always Cull Off Fog { Mode Off }

CGINCLUDE

#include "UnityCG.cginc"

// This is just getting rediculous, why isn't there a UNITY_VERSION definition???

#if defined(UNITY_PI)
	#include "Internal-PrePassCollectShadows-50.cginc"
#elif defined(CBUFFER_START)
	#include "Internal-PrePassCollectShadows-40.cginc"
#else
	#include "Internal-PrePassCollectShadows-35.cginc"
#endif

ENDCG

CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#pragma exclude_renderers noshadows flash
#pragma glsl_no_auto_normalization
#pragma multi_compile_shadowcollector
#pragma target 3.0
ENDCG
}

}


Fallback Off
}
