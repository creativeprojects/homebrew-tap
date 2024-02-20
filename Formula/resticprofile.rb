# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Resticprofile < Formula
  desc "Configuration profiles for restic backup"
  homepage "https://github.com/creativeprojects/resticprofile"
  version "0.26.0"
  license "GPL-3.0-only"

  depends_on "restic" => :optional

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.26.0/resticprofile_no_self_update_0.26.0_darwin_arm64.tar.gz"
      sha256 "2f2049bbb5ab13a3d5d56ea6f5ff52397758b2fa7d4095a98bd484021ca3fa4b"

      def install
        bin.install "resticprofile"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.26.0/resticprofile_no_self_update_0.26.0_darwin_amd64.tar.gz"
      sha256 "24e5e344c3cdf937d5086ce5683ff8c6b5eca9127eb07de3e694b2612c295c13"

      def install
        bin.install "resticprofile"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.26.0/resticprofile_no_self_update_0.26.0_linux_arm64.tar.gz"
      sha256 "1fe4b5eae20e85e43b8a208f6a961c9708a818edb738b25da8442f702cd168a2"

      def install
        bin.install "resticprofile"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.26.0/resticprofile_no_self_update_0.26.0_linux_amd64.tar.gz"
      sha256 "2b1059dcea414530357197d9c380a902570f9befc2d59807d0febc252b804eae"

      def install
        bin.install "resticprofile"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.26.0/resticprofile_no_self_update_0.26.0_linux_armv6.tar.gz"
      sha256 "530388c3316e6b42c36c8d76b94e6a3be07ee5e03f96fbbf0b914666dc0b1704"

      def install
        bin.install "resticprofile"
      end
    end
  end

  head "https://github.com/creativeprojects/resticprofile.git"

  test do
    (testpath/"restic_repo").mkdir
    (testpath/"password.txt").write("key")
    (testpath/"profiles.yaml").write <<~EOS
      default:
        repository: "local:#{testpath}/restic_repo"
        password-file: "password.txt"
        initialize: true
    EOS

    (testpath/"testfile").write("This is a testfile")

    system "#{bin}/resticprofile", "backup", "testfile"
    system "#{bin}/resticprofile", "restore", "latest", "-t", "#{testpath}/restore"
    assert compare_file "testfile", "#{testpath}/restore/testfile"
  end
end
