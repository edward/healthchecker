class Wisdom
  WISDOMS_PATH = Rails.root.join('config/wisdoms.yml')
  class_attribute :wisdoms

  self.wisdoms = YAML.load(File.read(WISDOMS_PATH))

  def self.sample
    wisdoms.sample
  end
end
