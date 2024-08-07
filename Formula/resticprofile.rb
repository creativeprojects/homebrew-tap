# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Resticprofile < Formula
  desc "Configuration profiles for restic backup"
  homepage "https://github.com/creativeprojects/resticprofile"
  version "0.27.1"
  license "GPL-3.0-only"

  depends_on "restic" => :optional

  on_macos do
    on_intel do
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.27.1/resticprofile_no_self_update_0.27.1_darwin_amd64.tar.gz"
      sha256 "9f334830070b9fc751cca2d6f607094c562d7ce5b215b1bac38ae9bbb0dec724"

      def install
        bin.install "resticprofile"
      end
    end
    on_arm do
      url "https://github.com/creativeprojects/resticprofile/releases/download/v0.27.1/resticprofile_no_self_update_0.27.1_darwin_arm64.tar.gz"
      sha256 "c2b94d29081cad33d8d1723037043ae436a23297be292ffa4674a5b13e80d4f3"

      def install
        bin.install "resticprofile"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.27.1/resticprofile_no_self_update_0.27.1_linux_amd64.tar.gz"
        sha256 "4b15e1993f9f9264279b0fcabb4325a1e0190d86ba7952d2ef8ddad7716f250d"

        def install
          bin.install "resticprofile"
        end
      end
    end
    on_arm do
      if !Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.27.1/resticprofile_no_self_update_0.27.1_linux_armv6.tar.gz"
        sha256 "a189a0164351fcd3b3a88a55cc7b9469b3146b0e443ae83ea7c692742ddff5cf"

        def install
          bin.install "resticprofile"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/creativeprojects/resticprofile/releases/download/v0.27.1/resticprofile_no_self_update_0.27.1_linux_arm64.tar.gz"
        sha256 "9f25b5156905d5224542ce896c377dd4462f8fe71a07b80f61271ec1d6bf00a6"

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
