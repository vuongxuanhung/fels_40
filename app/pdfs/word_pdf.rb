class WordPdf < Prawn::Document
  def initialize(words)
    super()
    @words = words
    content
  end

  def content
    @words.map do |word|
      y_position = cursor - 20
      bounding_box([100, y_position], width: 100, height: 20 ) do
        text word.content, style: :bold
      end
      bounding_box([200, y_position], width: 100, height: 20) do
        text word.answers.find_by(correct: true).content
      end
    end
  end
end
