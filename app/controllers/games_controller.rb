class GamesController < ApplicationController
  def new
    @letters = []
    lettr = "abcdefghijklmnopqrstuvwxyz"
    10.times do
      @letters << lettr[rand(26)]
    end
  end
  def score
    # Change the user input to an array of letters
    entry = params[:input].split(//)
    # What is the score?
    score = entry.length
    # For each of these letters, check that these letters are not duplicated and are allowed.
    entry.each do |le|
      if @letters.include?(le)
        play.remove(le)
      else
        return "The word can’t be built out of the original grid"
      end
    end
    # Display the final score
    @score = entry.length
    return @score
  end
end
