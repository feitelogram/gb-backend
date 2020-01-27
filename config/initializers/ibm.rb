authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
  apikey: ENV["WATSON"]
)

ASSISTANT = IBMWatson::AssistantV2.new(
    authenticator: authenticator,
    version: "2018-09-17"
  )
  ASSISTANT.service_url = "https://api.us-south.assistant.watson.cloud.ibm.com/instances/337e2e55-469d-4138-aaa0-7c284e90e019"
  
  response = ASSISTANT.create_session(
    assistant_id: ENV["AID"]
  )
  
  puts JSON.pretty_generate(response.result)
  
  SESSION_ID = response.result["session_id"]
  ASSISTANT_ID = ENV["AID"]
