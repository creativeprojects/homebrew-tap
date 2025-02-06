# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Resticprofile < Formula
  desc "Configuration profiles for restic backup"
  homepage "https://github.com/creativeprojects/resticprofile"
  version "0.29.1"
  license "GPL-3.0-only"

  depends_on "restic" => :optional

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.29.1/resticprofile_no_self_update_0.29.1_darwin_amd64.tar.gz"
      sha256 "cbfeee1c70dcf75568548c9f0961b0de73ae6c9af8bee30750cef7137719a5be"

      def install
        bin.install "resticprofile"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.29.1/resticprofile_no_self_update_0.29.1_darwin_arm64.tar.gz"
      sha256 "968ae400049b0fc0e2d312eaad8d2e91422fbc6e07ba7560d73b105eaa31b8a0"

      def install
        bin.install "resticprofile"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.29.1/resticprofile_no_self_update_0.29.1_linux_amd64.tar.gz"
        sha256 "458dbc490a3c4f22ddf152d9fc4505a2db50a4dfea418e731567e5284007b00f"

        def install
          bin.install "resticprofile"
        end
      end
    end
    if Hardware::CPU.arm?
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.29.1/resticprofile_no_self_update_0.29.1_linux_armv6.tar.gz"
        sha256 "719d3e9c172fc3bb7a3f47bf53f0d1412c9fa1dc6b8eff49aef26e5496a8b49f"

        def install
          bin.install "resticprofile"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.29.1/resticprofile_no_self_update_0.29.1_linux_arm64.tar.gz"
        sha256 "c178dfe6072b7afd10f2df7b0ad0dfe009900074aa2f48936d31fde600d641c8"

        def install
          bin.install "resticprofile"
        end
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
