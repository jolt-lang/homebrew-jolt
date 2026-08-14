class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.11/jolt-v0.7.11-aarch64-macos.tar.gz"
      sha256 "51d05a6de8ff5891490ca4cd1ffb189dfcb59e1e2001b396a9fb6002a55269c7"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.11/jolt-v0.7.11-x86_64-linux.tar.gz"
      sha256 "7b2f308f09e8a515d380740abdd3ff8fd438c65ff341ba75ed3a949f695130f2"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
