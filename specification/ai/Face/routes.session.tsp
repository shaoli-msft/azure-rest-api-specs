import "@typespec/http";
import "@typespec/rest";
import "@azure-tools/typespec-azure-core";
import "./models.session.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.Core;
using Azure.Core.Traits;
using Foundations;

namespace Face;

interface BaseSessions<
  T extends LivenessSessionItem,
  U extends BaseSessionAuditEntry
> {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "ResourceList does not fit, we put object array in response directly"
  listSessions is FaceResourceListOperation<T, LivenessSessionItem>;

  getSession is Operations.ResourceRead<T>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "ResourceDelete does not fit, we return 200 instead of 204"
  @deletesResource(T)
  deleteSession is FaceResourceDeleteOperation<T>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "ResourceList does not fit, we put object array in response directly"
  listSessionAuditEntries is Foundations.NonPagedResourceList<
    U,
    ServiceTraits & ListQueryParametersTrait<ListRequestOptions>
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  @get
  getSessionImage is Foundations.ResourceOperation<
    T,
    {
      @doc("The request ID of the image to be retrieved")
      @path
      @segment("sessionImages")
      sessionImageId: string;
    },
    {
      @doc("The format of the HTTP payload.")
      @header
      contentType: "application/octet-stream";

      @doc("The image to be analyzed")
      @body
      imageContent: bytes;
    },
    ServiceTraits
  >;
}

interface LivenessSessions
  extends BaseSessions<LivenessSession, LivenessSessionAuditEntry> {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "ResourceCreateWithServiceProvidedName does not fit, we don't return Location in header."
  createSession is FaceResourceCreateWithServiceProvidedName<
    LivenessSession,
    LivenessSessionCreationContent,
    LivenessSessionCreationResult
  >;
}

interface LivenessWithVerifySessions
  extends BaseSessions<
      LivenessWithVerifySession,
      LivenessWithVerifySessionAuditEntry
    > {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "ResourceCreateWithServiceProvidedName does not fit, we don't return Location in header."
  @sharedRoute
  createSession is FaceResourceCreateWithServiceProvidedName<
    LivenessWithVerifySession,
    LivenessSessionCreationContent,
    LivenessSessionCreationResult
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  #suppress "@azure-tools/typespec-azure-core/byos" "Representation of existing multipart/form-data operation"
  @sharedRoute
  createSessionWithVerifyImage is FaceResourceCreateWithServiceProvidedName<
    LivenessWithVerifySession,
    LivenessSessionWithVerifyImageCreationContent,
    LivenessSessionCreationResult
  >;
}

#suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
@post
@sharedRoute
@route("/face/{apiVersion}/detect")
op detectFromSessionImageId is Azure.Core.RpcOperation<
  FaceDetectionOptions & {
    @doc("The format of the HTTP payload.")
    @header
    contentType: "application/json";

    @doc("Id of session image.")
    sessionImageId: string;
  },
  Body<FaceDetectionResult[]>,
  ServiceTraits
>;
