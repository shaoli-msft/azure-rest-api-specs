import "@typespec/http";
import "@typespec/rest";
import "@azure-tools/typespec-azure-core";
import "./models.persongroup.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Azure.Core;
using Azure.Core.Traits;
using Foundations;

namespace Face;

interface PersonGroupOperations {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create has no response body while standard op requires resource in body"
  createPersonGroup is FaceResourceCreateOperation<PersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deletePersonGroup is FaceResourceDeleteOperation<PersonGroup>;

  getPersonGroup is FaceResourceReadOperationWithReturnRecognitionModelOptions<PersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updatePersonGroup is FaceResourceUpdateOperation<PersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listPersonGroups is FaceResourceListOperation<
    PersonGroup,
    PersonGroup,
    ReturnRecognitionModelOptions
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  getPersonGroupTrainingStatus is FaceResourceGetTrainingStatus<PersonGroup>;

  @pollingOperation(PersonGroupOperations.getPersonGroupTrainingStatus)
  trainPersonGroup is FaceResourceTrain<PersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create person perform on resource collection but not response created resorce location in header"
  createPersonGroupPerson is FaceResourceCreateWithServiceProvidedName<PersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deletePersonGroupPerson is FaceResourceDeleteOperation<PersonGroupPerson>;

  getPersonGroupPerson is Operations.ResourceRead<PersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updatePersonGroupPerson is FaceResourceUpdateOperation<PersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listPersonGroupPerson is FaceResourceListOperation<PersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  addPersonGroupPersonFaceFromUrl is AddFaceFromUrl<PersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  #suppress "@azure-tools/typespec-azure-core/byos" "It's an RPC call to detect face from an image, it doesn't store anything. There's a BYOS version of this call, but it's not this one."
  addPersonGroupPersonFaceFromStream is AddFaceFromStream<PersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deletePersonGroupPersonFace is FaceResourceDeleteOperation<PersonGroupPersonFace>;

  getPersonGroupPersonFace is Operations.ResourceRead<PersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updatePersonGroupPersonFace is FaceResourceUpdateOperation<PersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create has no response body while standard op requires resource in body"
  createLargePersonGroup is FaceResourceCreateOperation<LargePersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteLargePersonGroup is FaceResourceDeleteOperation<LargePersonGroup>;

  getLargePersonGroup is FaceResourceReadOperationWithReturnRecognitionModelOptions<LargePersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateLargePersonGroup is FaceResourceUpdateOperation<LargePersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listLargePersonGroups is FaceResourceListOperation<
    LargePersonGroup,
    LargePersonGroup,
    ReturnRecognitionModelOptions
  >;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  getLargePersonGroupTrainingStatus is FaceResourceGetTrainingStatus<LargePersonGroup>;

  @pollingOperation(PersonGroupOperations.getLargePersonGroupTrainingStatus)
  trainLargePersonGroup is FaceResourceTrain<LargePersonGroup>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Create person perform on resource collection but not response created resorce location in header"
  createLargePersonGroupPerson is FaceResourceCreateWithServiceProvidedName<LargePersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteLargePersonGroupPerson is FaceResourceDeleteOperation<LargePersonGroupPerson>;

  getLargePersonGroupPerson is Operations.ResourceRead<LargePersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateLargePersonGroupPerson is FaceResourceUpdateOperation<LargePersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "List doesn't support Azure paging"
  listLargePersonGroupPerson is FaceResourceListOperation<LargePersonGroupPerson>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  addLargePersonGroupPersonFaceFromUrl is AddFaceFromUrl<LargePersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Add face perform on resource collection but not response created resorce location in header"
  #suppress "@azure-tools/typespec-azure-core/byos" "It's an RPC call to detect face from an image, it doesn't store anything. There's a BYOS version of this call, but it's not this one."
  addLargePersonGroupPersonFaceFromStream is AddFaceFromStream<LargePersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Delete response with 200 while standard op requires 204"
  deleteLargePersonGroupPersonFace is FaceResourceDeleteOperation<LargePersonGroupPersonFace>;

  getLargePersonGroupPersonFace is Operations.ResourceRead<LargePersonGroupPersonFace>;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Update has no response body while standard op requires resource in body"
  updateLargePersonGroupPersonFace is FaceResourceUpdateOperation<LargePersonGroupPersonFace>;
}
