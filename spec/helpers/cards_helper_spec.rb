require 'spec_helper'
describe CardsHelper do

  describe 'to_html' do
    it 'should convert model to html' do
      card = build :card, id: 17, description: 'a description', points: 1, status: 'ready', project_id: 19, updated_at: Time.parse('2012-01-01 00:00')

      html_string = to_html(card)

      html_doc = Nokogiri::XML(html_string)

      html_doc.xpath('article/h2').text.should == card.description
      html_doc.xpath('article/span[1]').text.should == card.points.to_s
      html_doc.xpath('article/span[2]').text.should == card.status

      Time.parse(html_doc.xpath('article/span[3]').text).should == card.updated_at

    end
  end

end
