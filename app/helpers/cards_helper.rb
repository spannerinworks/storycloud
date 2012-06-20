
module CardsHelper
  def to_html(card)
    ::Builder::XmlMarkup.new(:indent=>2).article do |b|
      b.h2 card.description
      b.span card.points
      b.span card.status
      b.span card.updated_at
    end
  end
end
