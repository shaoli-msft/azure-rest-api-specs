import "@typespec/http";
import "@typespec/rest";
import "@azure-tools/typespec-azure-core";
import "./models.common.tsp";
import "./models.detect.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.Core;
using Azure.Core.Traits;
using Foundations;

namespace Face;

@sharedRoute
@post
@route("/face/{apiVersion}/identify")
op IdentifyOperation<T extends TypeSpec.Reflection.Model> is Azure.Core.RpcOperation<
  {
    @doc("Array of query faces faceIds, created by the Face - Detect. Each of the faces are identified independently. The valid number of faceIds is between [1, 10].")
    faceIds: string[];

    ...T;

    @doc("The range of maxNumOfCandidatesReturned is between 1 and 100 (default is 10).")
    maxNumOfCandidatesReturned?: int32;

    @doc("Customized identification confidence threshold, in the range of [0, 1]. Advanced user can tweak this value to override default internal threshold for better precision on their scenario data. Note there is no guarantee of this threshold value working on other data and after algorithm updates.")
    confidenceThreshold?: float32;
  },
  Body<FaceIdentificationResult[]>,
  ServiceTraits
>;

@sharedRoute
@post
@route("/face/{apiVersion}/verify")
op VerifyOperation<T extends TypeSpec.Reflection.Model> is Azure.Core.RpcOperation<
  {
    @doc("faceId of the face, comes from Face - Detect.")
    faceId: string;

    ...T;
  },
  FaceVerificationResult,
  ServiceTraits
>;

@doc("Given query face's faceId, to search the similar-looking faces from a faceId array, a face list or a large face list.")
@sharedRoute
@post
@route("/face/{apiVersion}/findsimilars")
op FindSimilarOperation<Ttarget extends TypeSpec.Reflection.Model> is Azure.Core.RpcOperation<
  {
    @doc("faceId of the face, comes from Face - Detect.")
    faceId: string;

    @doc("The number of top similar faces returned. The valid range is [1, 1000].It defaults to 20.")
    maxNumOfCandidatesReturned?: int32;

    @doc("Similar face searching mode. It can be 'matchPerson' or 'matchFace'. It defaults to 'matchPerson'.")
    mode?: FindSimilarMatchMode;

    ...Ttarget;
  },
  Body<FaceFindSimilarResult[]>,
  ServiceTraits
>;

interface FaceRecognitionOperations {
  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  findSimilar is FindSimilarOperation<{
    @doc("An array of candidate faceIds. All of them are created by Face - Detect and the faceIds will expire 24 hours after the detection call. The number of faceIds is limited to 1000.")
    faceIds: string[];
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path"
  findSimilarFromFaceList is FindSimilarOperation<{
    @doc("An existing user-specified unique candidate face list, created in FaceList - Create. Face list contains a set of persistedFaceIds which are persisted and will never expire.")
    faceListId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path"
  findSimilarFromLargeFaceList is FindSimilarOperation<{
    @doc("An existing user-specified unique candidate large face list, created in LargeFaceList - Create. Large face list contains a set of persistedFaceIds which are persisted and will never expire.")
    largeFaceListId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  identifyFromPersonGroup is IdentifyOperation<{
    @doc("Id of the target person group, created by PersonGroup - Create.")
    personGroupId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  identifyFromLargePersonGroup is IdentifyOperation<{
    @doc("Id of the target person group, created by LargePersonGroup - Create.")
    largePersonGroupId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  identifyFromPersonDirectory is IdentifyOperation<{
    @doc("Array of personIds created in PersonDirectory - PersonCreate. The valid number of personIds is between [1,30].")
    personIds: string[];
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  identifyFromDynamicPersonGroup is IdentifyOperation<{
    @doc("Id of the target PersonDirectory DynamicPersonGroup to match against.")
    dynamicPersonGroupId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  @doc("Verify whether two faces belong to a same person or whether one face belongs to a person.")
  @sharedRoute
  @post
  @route("/face/{apiVersion}/verify")
  verifyFaceToFace is Azure.Core.RpcOperation<
    {
      @doc("faceId of the face, comes from Face - Detect.")
      faceId1: string;

      @doc("faceId of the face, comes from Face - Detect.")
      faceId2: string;
    },
    FaceVerificationResult,
    ServiceTraits
  >;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  verifyFromPersonGroup is VerifyOperation<{
    @doc("Id of the target person group, created by PersonGroup - Create.")
    personGroupId: string;

    @doc("Specify a certain person in person group.")
    personId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  verifyFromLargePersonGroup is VerifyOperation<{
    @doc("Id of the target person group, created by LargePersonGroup - Create.")
    largePersonGroupId: string;

    @doc("Specify a certain person in person group.")
    personId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  verifyFromPersonDirectory is VerifyOperation<{
    @doc("Specify a certain person in PersonDirectory Person.")
    personId: string;
  }>;

  #suppress "@azure-tools/typespec-azure-core/no-rpc-path-params" "Workaround for RpcOperation not handling api version in path."
  @doc("Divide candidate faces into groups based on face similarity.")
  @post
  @route("/face/{apiVersion}/group")
  group is Azure.Core.RpcOperation<
    {
      @doc("Array of candidate faceId created by Face - Detect. The maximum is 1000 faces.")
      faceIds: string[];
    },
    FaceGroupingResult,
    ServiceTraits
  >;
}
