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

interface BaseSessionInterface<T extends LivenessSessionItem, U extends BaseSessionAuditEntry> {
  // ResourceCreateOrReplace does not fit, we use POST to create
  // ResourceCreateWithServiceProvidedName does not fit, we have data in response body
  #suppress "@azure-tools/typespec-azure-core/casing-style" "This is a template"
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  @createsResource(T)
  CreateSession is Foundations.ResourceCollectionOperation<
    T,
    LivenessSessionCreationContent,
    LivenessSessionCreationResult,
    ServiceTraits
  >;

  // ResourceList does not fit, we put object array in response directly
  // NonPagedResourceList does not fit, we need customize the response object for any template type
  #suppress "@azure-tools/typespec-azure-core/casing-style" "This is a template"
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  ListSessions is FaceResourceListOperation<T, LivenessSessionItem>;

  #suppress "@azure-tools/typespec-azure-core/casing-style" "This is a template"
  GetSession is Operations.ResourceRead<T>;

  // ResourceDelete does not fit, we return 200 instead of 204
  #suppress "@azure-tools/typespec-azure-core/casing-style" "This is a template"
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  @deletesResource(T)
  DeleteSession is FaceResourceDeleteOperation<T>;

  // ResourceList does not fit, we put object array in response directly
  #suppress "@azure-tools/typespec-azure-core/casing-style" "This is a template"
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  ListSessionAuditEntries is Foundations.NonPagedResourceList<
    U,
    ServiceTraits & ListQueryParametersTrait<ListRequestOptions>
  >;
}

alias LivenessInterface = BaseSessionInterface<LivenessSession, LivenessSessionAuditEntry>;
alias LivenessWithVerifyInterface = BaseSessionInterface<LivenessWithVerifySession, LivenessWithVerifySessionAuditEntry>;

interface SessionOperations {
  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  createLivenessSession is LivenessInterface.CreateSession;

  getLivenessSession is LivenessInterface.GetSession;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  deleteLivenessSession is LivenessInterface.DeleteSession;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  listLivenessSessions is LivenessInterface.ListSessions;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  listLivenessSessionAuditEntries is LivenessInterface.ListSessionAuditEntries;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  @sharedRoute
  createLivenessWithVerifySessionByJson is LivenessWithVerifyInterface.CreateSession;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  #suppress "@azure-tools/typespec-azure-core/byos" "Representation of existing multipart/form-data operation"
  @sharedRoute
  @createsResource(LivenessWithVerifySession)
  createLivenessWithVerifySessionByFormData is Foundations.ResourceCollectionOperation<
    LivenessWithVerifySession,
    LivenessWithVerifySessionCreationContent,
    LivenessSessionCreationResult,
    ServiceTraits>;

  getLivenessWithVerifySession is LivenessWithVerifyInterface.GetSession;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  deleteLivenessWithVerifySession is LivenessWithVerifyInterface.DeleteSession;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  @sharedRoute
  listLivenessWithVerifySessions is LivenessWithVerifyInterface.ListSessions;

  #suppress "@azure-tools/typespec-azure-core/use-standard-operations" "Doesn't fit standard ops"
  listLivenessWithVerifySessionAuditEntries is LivenessWithVerifyInterface.ListSessionAuditEntries;
}
