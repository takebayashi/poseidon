module Poseidon
  module Compression
    module Lz4Codec
      def self.codec_id
        3
      end

      def self.compress(s)
        check!
        LZ4::compress(s)
      end

      def self.decompress(s)
        check!
        LZ4::uncompress(s)
      end

      def self.check!
        @checked ||= begin
          require 'lz4-ruby'
          true
        rescue LoadError
          raise "LZ4 compression is not available, please install the 'lz4-ruby' gem"
        end
      end

    end
  end
end
