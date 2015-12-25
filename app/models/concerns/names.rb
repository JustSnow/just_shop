module Names
  extend ActiveSupport::Concern

  delegate :to_s, to: :name

  def name
    @name ||= public_name || email
  end

  def public_name
    @public_name ||= "#{first_name} #{last_name}".strip.presence
  end
end
