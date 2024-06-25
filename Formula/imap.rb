# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Imap < Formula
  desc "IMAP tools: backup, copy, move your emails between servers and locally"
  homepage "https://github.com/creativeprojects/imap"
  version "0.3.6"
  license "GPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.6/imap_0.3.6_darwin_amd64.tar.gz"
      sha256 "b09a6cc2404117b4d7acb674657249f9176ab263aca0db901a010160db482c5f"

      def install
        bin.install "imap"
      end
    end
    on_arm do
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.6/imap_0.3.6_darwin_arm64.tar.gz"
      sha256 "2704b1bd0fc5a13d9e655551ad7ad0d7e9014ad8a7f6ad4a9b303e3d513903a2"

      def install
        bin.install "imap"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.6/imap_0.3.6_linux_amd64.tar.gz"
        sha256 "eb28bd8e4ffd529325baa4b4cf0026b1c2a8e05a2aef1c907a369b6d2f03e2b6"

        def install
          bin.install "imap"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.6/imap_0.3.6_linux_armv6.tar.gz"
        sha256 "de312e47f44af615f8e1b6966d652ba26b2c74d08daa7be035bfd609a416e1dd"

        def install
          bin.install "imap"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.6/imap_0.3.6_linux_arm64.tar.gz"
        sha256 "314da71a59b3f1f329b11f0fb98ff0c06834c5f86e75e1ff86e690ef2ae41883"

        def install
          bin.install "imap"
        end
      end
    end
  end

  head "https://github.com/creativeprojects/imap.git"
end
