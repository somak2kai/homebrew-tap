# typed: false
# frozen_string_literal: true

class Jbeats < Formula
  desc "Parses Java source files and emits per-method structural metadata as JSON"
  homepage "https://github.com/somak2kai/jbeats"
  version "0.1.2"
  license "MIT"

  JBEATS_SHA256_DARWIN_ARM64 = "8b31a1ae2c15cd044f8f850b2441a2fead5fd20dbefc999f5cae503a8067f61c"
  JBEATS_SHA256_LINUX_AMD64  = "c170a034ba49d5122cc7b782ce4a4249203bb445076994651762c0015c2a170e"
  JBEATS_SHA256_LINUX_ARM64  = "98a496f857fbc6a1c8710fffddafcf7227e16791f165cc0ccd0690fffa105246"

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
