import "@typespec/http";
import "@typespec/rest";
import "@azure-tools/typespec-azure-core";
import "./models.facelist.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.Core;
using Azure.Core.Traits;
using Foundations;

namespace Face;

interface FaceListOperations {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create has no response body while standard op requires resource in body"
  createFaceList is FaceResourceCreateOperation<FaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteFaceList is FaceResourceDeleteOperation<FaceList>;

  getFaceList is FaceResourceReadOperationWithReturnRecognitionModelOptions<FaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateFaceList is FaceResourceUpdateOperation<FaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listFaceLists is Foundations.ResourceList<
    FaceList,
    ReturnRecognitionModelOptions,
    Body<FaceList[]>,
    ServiceTraits
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  addFaceListFaceFromUrl is AddFaceFromUrl<FaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  #suppress "@azure-tools/typespec-azure-core/byos" "It's an RPC call to detect face from an image, it doesn't store anything. There's a BYOS version of this call, but it's not this one."
  addFaceListFaceFromStream is AddFaceFromStream<FaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteFaceListFace is FaceResourceDeleteOperation<FaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create has no response body while standard op requires resource in body"
  createLargeFaceList is FaceResourceCreateOperation<LargeFaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteLargeFaceList is FaceResourceDeleteOperation<LargeFaceList>;

  getLargeFaceList is FaceResourceReadOperationWithReturnRecognitionModelOptions<LargeFaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateLargeFaceList is FaceResourceUpdateOperation<LargeFaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listLargeFaceLists is FaceResourceListOperation<
    LargeFaceList,
    LargeFaceList,
    ReturnRecognitionModelOptions
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "GET operation on resource with sub-path"
  getLargeFaceListTrainingStatus is FaceResourceGetTrainingStatus<LargeFaceList>;

  @pollingOperation(FaceListOperations.getLargeFaceListTrainingStatus)
  trainLargeFaceList is FaceResourceTrain<LargeFaceList>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  addLargeFaceListFaceFromUrl is AddFaceFromUrl<LargeFaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  #suppress "@azure-tools/typespec-azure-core/byos" "It's an RPC call to detect face from an image, it doesn't store anything. There's a BYOS version of this call, but it's not this one."
  addLargeFaceListFaceFromStream is AddFaceFromStream<LargeFaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteLargeFaceListFace is FaceResourceDeleteOperation<LargeFaceListFace>;

  getLargeFaceListFace is Operations.ResourceRead<LargeFaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateLargeFaceListFace is FaceResourceUpdateOperation<LargeFaceListFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  @sharedRoute
  listLargeFaceListFaces is FaceResourceListOperation<LargeFaceListFace>;
}
