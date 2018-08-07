class Reward < ActiveRecord::Base
  has_many :redemptions
  before_destroy :no_referenced_redemptions

  enum flavor: [:ifttt, :cash]

  private

  def no_referenced_redemptions
    return if redemptions.empty?

    errors.add :base, "This reward is referenced by redemption(s): #{redemptions.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end

end
