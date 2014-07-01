module Tarot
  module Entities
    class MajorArcana < Card
      attr_reader :title, :associations, :id

      def initialize(id)
        ensure_valid_input!(id)
        super(:major)

        @title        = MAJOR_ARCANA[id].title
        @associations = MAJOR_ARCANA[id].associations
        @id           = id
      end

      def display_name
        title
      end

      private

      def ensure_valid_input!(id)
        ensure_required_input!(:id, id)
        ensure_valid_id!(id)
      end

      def ensure_valid_id!(id)
        unless valid_ids.include?(id)
          reason = "Only #{valid_ids.join(', ')} are valid Major Arcana IDs"
          raise_argument_error reason, id
        end
      end

      def valid_ids
        MAJOR_ARCANA.keys
      end

    end
  end
end
