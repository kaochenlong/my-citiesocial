module CodeGenerator
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :code_generator, use: :slugged, slug_column: :code
  end

  private

  def code_generator
    SecureRandom.hex(10)
  end
end

