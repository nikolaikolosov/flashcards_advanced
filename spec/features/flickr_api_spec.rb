describe 'FlickrAPI' do
  it 'seacrh photos request' do
    stub_request(:post, 'https://api.flickr.com/services/rest/')
      .with(body: hash_including(method: 'flickr.photos.search'))
      .to_return(status: 200)
  end
end