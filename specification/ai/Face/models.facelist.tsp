import "@typespec/http";
import "@typespec/rest";
import "@azure-tools/typespec-azure-core";
import "./models.common.tsp";

using Azure.Core;
using TypeSpec.Http;
using TypeSpec.Rest;

namespace Face;

@doc("Base model for face list.")
model BaseFaceList {
  ...UserDefinedFields;

  @doc("The 'recognitionModel' associated with this face list. Supported 'recognitionModel' values include 'recognition_01', 'recognition_02, 'recognition_03', and 'recognition_04'. The default value is 'recognition_01'. 'recognition_04' is recommended since its accuracy is improved on faces wearing masks compared with 'recognition_03', and its overall accuracy is improved compared with 'recognition_01' and 'recognition_02'.")
  recognitionModel?: RecognitionModel = "recognition_01";
}

@doc("Face list is a list of faces, up to 1,000 faces.")
@resource("facelists")
model FaceList is BaseFaceList {
  @key
  @visibility("read")
  @doc("Valid character is letter in lower case or digit or '-' or '_', maximum length is 64.")
  faceListId: groupId;

  @doc("Face ids of registered faces in the face list.")
  @visibility("read")
  persistedFaces?: FaceListFace[];
}

@doc("Face list item for list face list.")
model FaceListItem is BaseFaceList {
  @doc("Valid character is letter in lower case or digit or '-' or '_', maximum length is 64.")
  faceListId: groupId;
}

@parentResource(FaceList)
@doc("Face resource for face list.")
model FaceListFace is BaseFace;

@doc("Large face list is a list of faces, up to 1,000,000 faces.")
@resource("largefacelists")
model LargeFaceList is BaseFaceList {
  @key
  @visibility("read")
  @doc("Valid character is letter in lower case or digit or '-' or '_', maximum length is 64.")
  largeFaceListId: groupId;
}

@parentResource(LargeFaceList)
@doc("Face resource for large face list.")
model LargeFaceListFace is BaseFace;

alias FaceListCreateErrorResponse = FaceListCreate400Response | FaceListCreate401Response | FaceListCreate409Response;
model FaceListCreate400Response is Azure.Core.Foundations.ErrorResponseBase<FaceListCreate400Error>;
model FaceListCreate401Response is Azure.Core.Foundations.ErrorResponseBase<FaceListCreate401Error>;
model FaceListCreate409Response is Azure.Core.Foundations.ErrorResponseBase<FaceListCreate409Error>;

model FaceListCreate400Error is FaceError;
model FaceListCreate401Error is FaceError;
model FaceListCreate409Error is FaceError;

@doc("Error response with BadArgument error code.")
model FaceListCreateErrorBadArgument extends FaceListCreate400Error {
  @doc("The BadArgument error code.")
  code: "BadArgument";

  @doc("""
    The error message of the BadArgument error.

    >
    *
      * 'name' is too long.
      * 'userData' is too long.
      * Bad and unrecognizable JSON body.
      * Face list ID is invalid. Valid format should be a string composed by numbers, English letters in lower case, '-', '_', and no longer than 64 characters.
      * 'recognitionModel' is invalid.
    """)
  message: string;
}

@doc("Error response with InvalidURL error code.")
model FaceListCreateErrorUnspecified extends FaceListCreate401Error {
  @doc("The Unspecified error code.")
  code: "Unspecified";

  @doc("""
    The error message of the Unspecified error.

    >
    *
      * Invalid subscription Key or user/plan is blocked.
    """)
  message: string;
}

@doc("Error response with FaceListExists error code.")
model FaceListCreateErrorFaceListExists extends FaceListCreate409Error {
  @doc("The FaceListExists error code.")
  code: "FaceListExists";

  @doc("""
    The error message of the FaceListExists error.

    >
    *
      * Face list already exists.
    """)
  message: string;
}

@doc("Error response with ConcurrentOperationConflict error code.")
model FaceListCreateErrorConcurrentOperationConflict extends FaceListCreate409Error {
  @doc("The ConcurrentOperationConflict error code.")
  code: "ConcurrentOperationConflict";

  @doc("""
    The error message of the ConcurrentOperationConflict error.

    >
    *
      * Concurrent operation conflict on requested resource.
    """)
  message: string;
}

@doc("The error object.")
model LargeFaceListCreateError {
  @doc("One of a server-defined set of error codes.")
  code: string;

  @doc("""
    Error message description

    >
    | Status Code | Error Code | Error Message |
    | ----------- | ---------- | ------------- |
    | 400 | BadArgument      | Large face list ID is invalid. |
    |     |                  | 'name' is empty. |
    |     |                  | 'name' is too long. |
    |     |                  | 'userData' is too long. |
    |     |                  | JSON parsing error. |
    |     |                  | 'recognitionModel' is invalid. |
    | 403 | QuotaExceeded    | Large Face List number reached limit. |
    | 401 | Unspecified      | Access denied due to invalid subscription key. Make sure you are subscribed to an API you are trying to call and provide the right key. |
    | 409 | LargeFaceListExists | Large face list already exists. |
  """)
  message: string;
}

model LargeFaceListCreateErrorResponse is Azure.Core.Foundations.ErrorResponseBase<LargeFaceListCreateError>;

@doc("The error object.")
model FaceResourceCreateError {
  @doc("One of a server-defined set of error codes.")
  code: string;

  @doc("A human-readable representation of the error.")
  message: string;
}

model FaceResourceCreateErrorResponse is Azure.Core.Foundations.ErrorResponseBase<FaceResourceCreateError>;
