
class ApiUrls{
  static String apiKey = "68a0e6ba63414a78ea11dfdc5e7502c2";
  static String baseUrl = "https://api.themoviedb.org/3";
  static String imagesPath  = "https://image.tmdb.org/t/p/";
  static String discoverTv = '$baseUrl/discover/tv?sort_by=popularity.desc&language=en-US';
  static String discoverMovies = '$baseUrl/discover/movie?sort_by=popularity.desc&language=en-US';
  static String search = '$baseUrl/search/multi?query';
  static String getTvDetails = '$baseUrl/tv/';
  static String getMovieDetails = '$baseUrl/movie/';
  static String getSimilar = '$baseUrl/similar/';
  static String getTopRatedMovies = '$baseUrl/movie/top_rated';

  static String imagePlaceHolder = 'https://flowbite.com/docs/images/examples/image-1@2x.jpg';
}