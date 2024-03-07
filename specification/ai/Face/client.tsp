import "@azure-tools/typespec-client-generator-core";
import "@typespec/rest";
import "@typespec/http";
import "@typespec/versioning";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Face;

@TypeSpec.Versioning.useDependency(Azure.Core.Versions.v1_0_Preview_2)
@TypeSpec.Versioning.useDependency(
  Face.Versions.v1_1_preview_1
)
namespace ClientCustomizations;

@client({
  name: "FaceClient",
  service: Face,
})
interface FaceClient {
  detectFromUrl is FaceDetectionOperations.detectFromUrl;
  detectFromStream is FaceDetectionOperations.detectFromStream;

  findSimilar is FaceRecognitionOperations.findSimilar;
  findSimilarFromFaceList is FaceRecognitionOperations.findSimilarFromFaceList;
  findSimilarFromLargeFaceList is FaceRecognitionOperations.findSimilarFromLargeFaceList;
  identifyFromPersonGroup is FaceRecognitionOperations.identifyFromPersonGroup;
  identifyFromLargePersonGroup is FaceRecognitionOperations.identifyFromLargePersonGroup;
  identifyFromPersonDirectory is FaceRecognitionOperations.identifyFromPersonDirectory;
  identifyFromDynamicPersonGroup is FaceRecognitionOperations.identifyFromDynamicPersonGroup;
  verifyFaceToFace is FaceRecognitionOperations.verifyFaceToFace;
  verifyFromPersonGroup is FaceRecognitionOperations.verifyFromPersonGroup;
  verifyFromLargePersonGroup is FaceRecognitionOperations.verifyFromLargePersonGroup;
  verifyFromPersonDirectory is FaceRecognitionOperations.verifyFromPersonDirectory;
  group is FaceRecognitionOperations.group;

  createFaceList is FaceListOperations.createFaceList;
  deleteFaceList is FaceListOperations.deleteFaceList;
  getFaceList is FaceListOperations.getFaceList;
  updateFaceList is FaceListOperations.updateFaceList;
  listFaceLists is FaceListOperations.listFaceLists;
  addFaceListFaceFromUrl is FaceListOperations.addFaceListFaceFromUrl;
  addFaceListFaceFromStream is FaceListOperations.addFaceListFaceFromStream;
  deleteFaceListFace is FaceListOperations.deleteFaceListFace;
  createLargeFaceList is FaceListOperations.createLargeFaceList;
  deleteLargeFaceList is FaceListOperations.deleteLargeFaceList;
  getLargeFaceList is FaceListOperations.getLargeFaceList;
  updateLargeFaceList is FaceListOperations.updateLargeFaceList;
  listLargeFaceLists is FaceListOperations.listLargeFaceLists;
  getLargeFaceListTrainingStatus is FaceListOperations.getLargeFaceListTrainingStatus;
  trainLargeFaceList is FaceListOperations.trainLargeFaceList;
  addLargeFaceListFaceFromUrl is FaceListOperations.addLargeFaceListFaceFromUrl;
  addLargeFaceListFaceFromStream is FaceListOperations.addLargeFaceListFaceFromStream;
  deleteLargeFaceListFace is FaceListOperations.deleteLargeFaceListFace;
  getLargeFaceListFace is FaceListOperations.getLargeFaceListFace;
  updateLargeFaceListFace is FaceListOperations.updateLargeFaceListFace;
  listLargeFaceListFaces is FaceListOperations.listLargeFaceListFaces;

  createPersonGroup is PersonGroupOperations.createPersonGroup;
  deletePersonGroup is PersonGroupOperations.deletePersonGroup;
  getPersonGroup is PersonGroupOperations.getPersonGroup;
  updatePersonGroup is PersonGroupOperations.updatePersonGroup;
  listPersonGroups is PersonGroupOperations.listPersonGroups;
  getPersonGroupTrainingStatus is PersonGroupOperations.getPersonGroupTrainingStatus;
  trainPersonGroup is PersonGroupOperations.trainPersonGroup;
  createPersonGroupPerson is PersonGroupOperations.createPersonGroupPerson;
  deletePersonGroupPerson is PersonGroupOperations.deletePersonGroupPerson;
  getPersonGroupPerson is PersonGroupOperations.getPersonGroupPerson;
  updatePersonGroupPerson is PersonGroupOperations.updatePersonGroupPerson;
  listPersonGroupPerson is PersonGroupOperations.listPersonGroupPerson;
  addPersonGroupPersonFaceFromUrl is PersonGroupOperations.addPersonGroupPersonFaceFromUrl;
  addPersonGroupPersonFaceFromStream is PersonGroupOperations.addPersonGroupPersonFaceFromStream;
  deletePersonGroupPersonFace is PersonGroupOperations.deletePersonGroupPersonFace;
  getPersonGroupPersonFace is PersonGroupOperations.getPersonGroupPersonFace;
  updatePersonGroupPersonFace is PersonGroupOperations.updatePersonGroupPersonFace;
  createLargePersonGroup is PersonGroupOperations.createLargePersonGroup;
  deleteLargePersonGroup is PersonGroupOperations.deleteLargePersonGroup;
  getLargePersonGroup is PersonGroupOperations.getLargePersonGroup;
  updateLargePersonGroup is PersonGroupOperations.updateLargePersonGroup;
  listLargePersonGroups is PersonGroupOperations.listLargePersonGroups;
  getLargePersonGroupTrainingStatus is PersonGroupOperations.getLargePersonGroupTrainingStatus;
  trainLargePersonGroup is PersonGroupOperations.trainLargePersonGroup;
  createLargePersonGroupPerson is PersonGroupOperations.createLargePersonGroupPerson;
  deleteLargePersonGroupPerson is PersonGroupOperations.deleteLargePersonGroupPerson;
  getLargePersonGroupPerson is PersonGroupOperations.getLargePersonGroupPerson;
  updateLargePersonGroupPerson is PersonGroupOperations.updateLargePersonGroupPerson;
  listLargePersonGroupPerson is PersonGroupOperations.listLargePersonGroupPerson;
  addLargePersonGroupPersonFaceFromUrl is PersonGroupOperations.addLargePersonGroupPersonFaceFromUrl;
  addLargePersonGroupPersonFaceFromStream is PersonGroupOperations.addLargePersonGroupPersonFaceFromStream;
  deleteLargePersonGroupPersonFace is PersonGroupOperations.deleteLargePersonGroupPersonFace;
  getLargePersonGroupPersonFace is PersonGroupOperations.getLargePersonGroupPersonFace;
  updateLargePersonGroupPersonFace is PersonGroupOperations.updateLargePersonGroupPersonFace;

  createPerson is PersonDirectoryOperations.createPerson;
  deletePerson is PersonDirectoryOperations.deletePerson;
  getPerson is PersonDirectoryOperations.getPerson;
  updatePerson is PersonDirectoryOperations.updatePerson;
  listPerson is PersonDirectoryOperations.listPerson;
  listDynamicPersonGroupReferences is PersonDirectoryOperations.listDynamicPersonGroupReferences;
  addPersonFaceFromUrl is PersonDirectoryOperations.addPersonFaceFromUrl;
  addPersonFaceFromStream is PersonDirectoryOperations.addPersonFaceFromStream;
  deletePersonFace is PersonDirectoryOperations.deletePersonFace;
  getPersonFace is PersonDirectoryOperations.getPersonFace;
  updatePersonFace is PersonDirectoryOperations.updatePersonFace;
  listPersonFace is PersonDirectoryOperations.listPersonFace;
  createDynamicPersonGroup is PersonDirectoryOperations.createDynamicPersonGroup;
  deleteDynamicPersonGroup is PersonDirectoryOperations.deleteDynamicPersonGroup;
  getDynamicPersonGroup is PersonDirectoryOperations.getDynamicPersonGroup;
  updateDynamicPersonGroup is PersonDirectoryOperations.updateDynamicPersonGroup;
  listDynamicPersonGroups is PersonDirectoryOperations.listDynamicPersonGroups;
  listDynamicPersonGroupPerson is PersonDirectoryOperations.listDynamicPersonGroupPerson;
}

@client({
  name: "FaceSessionClient",
  service: Face,
})
interface FaceSessionClient {
  createLivenessSession is LivenessSessionOperations.createLivenessSession;
  deleteLivenessSession is LivenessSessionOperations.deleteLivenessSession;
  getLivenessSession is LivenessSessionOperations.getLivenessSession;
  listLivenessSessions is LivenessSessionOperations.listLivenessSessions;
  listLivenessSessionAuditEntries is LivenessSessionOperations.listLivenessSessionAuditEntries;
  createLivenessWithVerifySession is LivenessSessionOperations.createLivenessWithVerifySession;
  createLivenessWithVerifySessionWithVerifyImage is LivenessSessionOperations.createLivenessWithVerifySessionWithVerifyImage;
  deleteLivenessWithVerifySession is LivenessSessionOperations.deleteLivenessWithVerifySession;
  getLivenessWithVerifySession is LivenessSessionOperations.getLivenessWithVerifySession;
  listLivenessWithVerifySessions is LivenessSessionOperations.listLivenessWithVerifySessions;
  listLivenessWithVerifySessionAuditEntries is LivenessSessionOperations.listLivenessWithVerifySessionAuditEntries;
}
