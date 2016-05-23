﻿Shader "NoodToProUnityShader/1_FlatColor"
{
	Properties
	{
		_Color("Color", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader
	{
		pass
		{
			CGPROGRAM
#pragma vertex vert
#pragma fragment frag

			uniform fixed4 _Color;
			
			struct vertexInput
			{
				float4 vertex : POSITION;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}

			fixed4 frag(vertexOutput i) : COLOR
			{
				fixed4 result;
				result = _Color;
				return result;
			}

			ENDCG
		}
	}
	Fallback "Diffuse"
}
