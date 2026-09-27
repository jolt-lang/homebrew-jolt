class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.13/jolt-v0.8.13-aarch64-macos.tar.gz"
      sha256 "69c11806761d8d04871ce9358c959d5a581aeb2d05d5a58c24adb46af2486faf"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.13/jolt-v0.8.13-x86_64-linux.tar.gz"
      sha256 "bc79b82f8e777172c865b26776c370c3e6791bd132c90cadeb7c140e3720ca09"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
