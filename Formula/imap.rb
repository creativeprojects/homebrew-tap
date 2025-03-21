# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Imap < Formula
  desc "IMAP tools: backup, copy, move your emails between servers and locally"
  homepage "https://github.com/creativeprojects/imap"
  version "0.3.9"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.9/imap_0.3.9_darwin_amd64.tar.gz"
      sha256 "79a5d3222548acf6e3bd9d9bad6524c097466b6022870c1f7f0de8d4a48686b9"

      def install
        bin.install "imap"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/creativeprojects/imap/releases/download/v0.3.9/imap_0.3.9_darwin_arm64.tar.gz"
      sha256 "4b56b12f41bf2ba82eeab6108756ebecabd34c5b8b39d8e370c5c3c605f3313e"

      def install
        bin.install "imap"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.9/imap_0.3.9_linux_amd64.tar.gz"
        sha256 "0db18682a61c07283a4bb7295e3c55f113c848b6801bd011d4155fcfadf1ca72"

        def install
          bin.install "imap"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.9/imap_0.3.9_linux_armv6.tar.gz"
        sha256 "119c2a62b4a69a105f406926989f58432a46fd84015fcd2b4261940a13c2315f"

        def install
          bin.install "imap"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/imap/releases/download/v0.3.9/imap_0.3.9_linux_arm64.tar.gz"
        sha256 "a0089ae897892fff6dbe8adf95021fead27dffd765791375000ff71a6c891fd3"

        def install
          bin.install "imap"
        end
      end
    end
  end

  head "https://github.com/creativeprojects/imap.git"
end
