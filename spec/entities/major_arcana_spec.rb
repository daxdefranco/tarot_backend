require 'spec_helper'

class MajorArcanaSpec < EntitySpec
  let(:title)         { 'The Chariot' }
  let(:arcana)        { :major }
  let(:id)            { '07' }
  let(:element)       { :water }
  let(:domain)        { [] }
  let(:associations)  { [] }
  let(:card)          { Entities::MajorArcana.new(id) }

  describe "creation" do
    describe "without" do
      describe "id" do
        let(:id) { nil }

        it('fails') { assert_failure {card} }
      end
    end

    describe "with wrong values" do
      describe "id" do
        let(:id)    { :seven }

        it('fails') { assert_failure {card} }
      end
    end

    it "is successful with correct values" do
      assert_kind_of Entities::MajorArcana, card

      assert_equal arcana,        card.arcana
      assert_equal title,         card.title
      assert_equal element,       card.element
      assert_equal domain,        card.domain
      assert_equal associations,  card.associations
      assert_equal id,            card.id
    end
  end

  describe "display_name" do
    it "returns the card's title" do
      assert_equal title, card.display_name
    end
  end

end