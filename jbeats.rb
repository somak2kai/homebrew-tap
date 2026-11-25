# typed: false
# frozen_string_literal: true

class Jbeats < Formula
  desc "Parses Java source files and emits per-method structural metadata as JSON"
  homepage "https://github.com/somak2kai/jbeats"
  version "0.1.7"
  license "MIT"

  JBEATS_SHA256_DARWIN_ARM64 = "ed6dd8404d945f947c2a374246f3d8888892dbe4314078c60cad53c51fff0534"
  JBEATS_SHA256_LINUX_AMD64  = "4fe14f58abfdfbf01871fae3b772d6aa5e4e06b11fbf683ae840bf252a32cbca"
  JBEATS_SHA256_LINUX_ARM64  = "156e90964beb9eb6ec45226374d31cb0de83d36edfe699aca4aeb5298500ed43"

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
