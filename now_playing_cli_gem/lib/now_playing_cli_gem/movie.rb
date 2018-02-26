class NowPlayingCliGem::Movie

  # Automatically sets up getter and setter methods for the instance variables
  attr_accessor :title, :details, :director

  def initialize
    title = title
    details = details
    director = director
  end

  # Returning scraped data of the movies
  def self.today
    self.scrape_movies
  end

  # Creating arrays of scraped data
  def self.scrape_movies
    movies = []

    movies << self.scrape_mazerunner
    movies << self.scrape_hostiles

    movies
  end

  # Scraping data for Maze Runner movie
  def self.scrape_mazerunner
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt4500922/?ref_=inth_ov_tt"))

    # Movie class instance
    title = doc.search("h1[itemprop='name']").text.strip
    details = doc.search("div[class='summary_text']").text.strip
    director = doc.search("[itemprop='director'] [itemprop='name']").text.strip
    movie = self.new(title, details, director)
    
    movie
  end

# Scraping data for Hostiles movie
  def self.scrape_hostiles
    doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt5478478/?ref_=inth_ov_tt"))

    # Movie class instance
    title = doc.search("h1[itemprop='name']").text.strip
    details = doc.search("div[class='summary_text']").text.strip
    director = doc.search("[itemprop='director'] [itemprop='name']").text.strip
    movie = self.new(title, details, director)
    
    movie
  end

end

#PROGRAM IS WORKING AND COMPLETE
