class CreateLinks
  def initialize(user, attraction, url)
    @user = user
    @attraction = attraction
    @url = url
  end

  def call
    create_links(@user, @attraction, @url)
  end

  private

 
end
