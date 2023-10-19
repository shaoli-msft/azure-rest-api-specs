import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;
using Azure.Core;

@useAuth(
  ApiKeyAuth<ApiKeyLocation.header, "Ocp-Apim-Subscription-Key">
)
@service({
  title: "Face Service",
})
@versioned(Face.Versions)
@server(
  "{endpoint}/face/{apiVersion}",
  "Provides algorithms for face detection and recognition",
  {
    @doc("""
Supported Cognitive Services endpoints (protocol and hostname, for example:
https://<resource-name>.cognitiveservices.azure.com).
""")
    endpoint: string,
    apiVersion: Versions
  }
)
namespace Face;

@doc("The Face service versions.")
enum Versions {
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @doc("The v1.0 version of the Face service.")
  v1_0: "v1.0",
}

model DetectedFace {
  faceId: string;
}

model UrlImage {
  url: string;
}

@post
@route("detect")
op detect(@body urlImage: UrlImage): DetectedFace[];
