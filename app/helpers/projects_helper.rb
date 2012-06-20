module ProjectsHelper
  def to_html(project)
    ::Builder::XmlMarkup.new(:indent=>2).article do |b|
      b.h2 project.name
      b.span project.updated_at
    end
  end
end
