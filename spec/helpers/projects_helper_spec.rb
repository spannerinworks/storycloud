require 'spec_helper'

describe ProjectsHelper do
  describe 'to_html' do
    it 'should convert model to html' do
      project = build :project, id: 17, name: 'a name', updated_at: Time.parse('2012-01-01 00:00')

      html_string = to_html(project)

      html_doc = Nokogiri::XML(html_string)

      html_doc.xpath('article/h2').text.should == project.name
      Time.parse(html_doc.xpath('article/span').text).should == project.updated_at

    end
  end
end
