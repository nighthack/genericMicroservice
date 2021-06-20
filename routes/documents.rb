# Call any helpers directly in code
require './utils/helpers'

get '/documents' do
  documents = Document.all.desc('_id').limit(10)
  return { 
    documents: documents.map{|x| 
      {
        document_id: x.document_id,
        user_id: x.user_id,
        details: x.details
      } 
    } 
  }.to_json
end

get '/documents/:id' do
  document = Document.find_by(document_id: params[:id])
  return { document: document }.to_json
end

post '/documents' do
  document = Document.where(
    document_id: params[:document_id]
  ).first_or_create
  document.update(
    text: params[:text],
    user_id: params[:user_id],
    details: params[:details])
  return { document: document }.to_json
end

private
  
  # response format for bots
  def build_response(message)
    return {
      "fulfillmentMessages" => [
        {
          "text": {
            "text": [
              message
            ]
          }
        }
      ]
    }.to_json
  end
