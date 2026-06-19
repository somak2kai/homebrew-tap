# typed: false
# frozen_string_literal: true

class Jbeats < Formula
  desc "Parses Java source files and emits per-method structural metadata as JSON"
  homepage "https://github.com/somak2kai/jbeats"
  version "0.1.4"
  license "MIT"

  JBEATS_SHA256_DARWIN_ARM64 = "91969f18e921e3a3252f7077b4476d847a3fa6335feac6c6f5e59334a2b66a4f"
  JBEATS_SHA256_LINUX_AMD64  = "448ec94202ac32755970227e9f2a65ed826da6ec95382d49ae2766c55d63ec0e"
  JBEATS_SHA256_LINUX_ARM64  = "8282e0f8ac0ad486ac6f403be93bbb1e5bacb6f6651cbaec47dbd66409dbe7dc"

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
