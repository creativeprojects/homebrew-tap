# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Imap < Formula
  desc "IMAP tools: backup, copy, move your emails between servers and locally"
  homepage "https://github.com/creativeprojects/imap"
  version "0.3.8"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.8/imap_0.3.8_darwin_amd64.tar.gz"
      sha256 "ca0a5750fbe64d5eaae54c0061c7e13e9c3ed17e99d25ea31cb6906677b633c6"

      def install
        bin.install "imap"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.8/imap_0.3.8_darwin_arm64.tar.gz"
      sha256 "d71cd37af044c724cefa325658a6f88dca21c346bf8e3f0784c3dfd2eabd0e57"

      def install
        bin.install "imap"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.8/imap_0.3.8_linux_amd64.tar.gz"
        sha256 "9c18a32d8d7fc21e2cc0732c17e4c55c9808f23d97343ace1341de10bb74b500"

        def install
          bin.install "imap"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.8/imap_0.3.8_linux_armv6.tar.gz"
        sha256 "c92fab40d0692e53dab28f4a514086ed21851dc8c3c105ba698dc071742d7d12"

        def install
          bin.install "imap"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.8/imap_0.3.8_linux_arm64.tar.gz"
        sha256 "4706faae31d2a4ead5145a67c861b116fe4dc98c2aea186e1d87dec6eec23a51"

        def install
          bin.install "imap"
        end
      end
    end
  end

  head "https://github.com/creativeprojects/imap.git"
end
