require 'offin/document-parsers'

# All things manifest.  Parse the XML, etc

class Manifest

  attr_reader :content, :filepath, :config

  def initialize config, filepath
    @config = config                  # currently unused, expected to shortly...
    @filepath = filepath
    @content = File.read(filepath)
    @manifest_sax_doc = ManifestSaxDocument.new
    Nokogiri::XML::SAX::Parser.new(@manifest_sax_doc).parse(@content)
  end

  # Need to do this the ruby metaprogramming way, whatever that is...


  # collections, identifiers and other_logos are (possibly empty) lists

  def collections
    @manifest_sax_doc.collections
  end

  def identifiers
    @manifest_sax_doc.identifiers
  end

  def other_logos
    @manifest_sax_doc.other_logos
  end

  # label, content_model, owning_user, owning_institution, submitting_institution are strings or nil

  def label
    @manifest_sax_doc.label
  end

  def content_model
    @manifest_sax_doc.content_model
  end

  def object_history
    @manifest_sax_doc.object_history
  end

  def owning_institution
    @manifest_sax_doc.owning_institution
  end

  def submitting_institution
    @manifest_sax_doc.submitting_institution
  end

  def owning_user
    @manifest_sax_doc.owning_user
  end

  # valid is a boolean that tells us whether the manifest xml document is valid.  This goes beyond schema validation

  def valid?
    @manifest_sax_doc.valid
  end

  def warnings?
    @manifest_sax_doc.warnings?
  end

  def errors?
    @manifest_sax_doc.errors?
  end

  def errors
    @manifest_sax_doc.errors
  end

  def warnings
    @manifest_sax_doc.warnings
  end

end