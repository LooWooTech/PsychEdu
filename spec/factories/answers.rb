FactoryGirl.define do
  factory :answer do
    content <<-CONTENT
For Rails 3.2 or Rails 4 you should use request.original_url to get the current URL. More detail.

For Rails 3: You want "\#{request.protocol}\#{request.host_with_port}\#{request.fullpath}", since request.url is now deprecated.

For Rails 2: You want request.url instead of request.request_uri. This combines the protocol (usually http://) with the host, and request_uri to give you the full address.
    CONTENT
  end
end
