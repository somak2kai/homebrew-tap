# typed: false
# frozen_string_literal: true

class Jbeats < Formula
  desc "Parses Java source files and emits per-method structural metadata as JSON"
  homepage "https://github.com/somak2kai/jbeats"
  version "0.1.5"
  license "MIT"

  JBEATS_SHA256_DARWIN_ARM64 = "7668e269b64a692db35901ed1ba19ec0e861f5fb4569a523a15fb1134d338885"
  JBEATS_SHA256_LINUX_AMD64  = "8c7d518ffc362fe9dc0b2fa1f5bb17c064ce0f5ffe7cf2d69817ee0907b507f8"
  JBEATS_SHA256_LINUX_ARM64  = "f9893ec361f96dff88ba40b51b6c0f4c8124672837cdf27321d6d2c7eb79759e"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/somak2kai/jbeats/releases/download/v#{version}/jbeats-darwin-arm64"
      sha256 JBEATS_SHA256_DARWIN_ARM64

      def install
        bin.install "jbeats-darwin-arm64" => "jbeats"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/somak2kai/jbeats/releases/download/v#{version}/jbeats-linux-amd64"
      sha256 JBEATS_SHA256_LINUX_AMD64

      def install
        bin.install "jbeats-linux-amd64" => "jbeats"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/somak2kai/jbeats/releases/download/v#{version}/jbeats-linux-arm64"
      sha256 JBEATS_SHA256_LINUX_ARM64

      def install
        bin.install "jbeats-linux-arm64" => "jbeats"
      end
    end
  end

  test do
    system "#{bin}/jbeats", "--version"
  end
end
