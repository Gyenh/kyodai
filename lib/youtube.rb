module Youtube
  def parse_video_url(url)
    @url = url

    youtube_formats = [
        %r(https?://youtu\.be/(.+)),
        %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
        %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
        %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
        %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b),
        %r(https?://music\.youtube\.com/watch\?v=(.*?)(&|#|$))
      ]

    @url.strip!

    if @url.include? "youtu"
      youtube_formats.find { |format| @url =~ format } and $1
      @results = {id: $1}
      @results.each do |key, value|
        @results = value
      end
    else
      return nil # There should probably be some error message here
    end
  end
end
