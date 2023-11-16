// {{{
#include <bits/stdc++.h>
#include <atcoder/all>
#define rep(i, n) for (long long i = 0; i < (long long)(n); ++i)
using namespace std;
using namespace atcoder;
using ull = unsigned long long;
using ll = long long;

namespace kuonruri {

	class UnionFind {
		public:
			explicit UnionFind(size_t NodeCountSum) : Parent(NodeCountSum, -1) {}

			// NodeAとNodeBに指定された頂点が同じグループか判定
			bool connect(unsigned long long NodeA, unsigned long long NodeB) {
				return root(NodeA) == root(NodeB);
			}

			// NodeAとNodeBに指定された頂点を同じ頂点にする。
			void merge(unsigned long long NodeA, unsigned long long NodeB) {
				NodeA = root(NodeA), NodeB = root(NodeB);
				if (NodeA == NodeB)
					return;
				if (Parent[NodeA] < Parent[NodeB]) {
					std::swap(NodeA, NodeB);
				}
				Parent[NodeA] += Parent[NodeB];
				Parent[NodeB] = NodeA;
			}

		   // Node引数に指定された頂点のグループの頂点数の合計を返却
			unsigned long long size(unsigned long long Node) {
				return -1 * Parent[root(Node)];
			}

		private:
			// -1で初期化
			// 根のときには -1 * そのグループの頂点数を保持
			// それ以外のときには、親の頂点を保持
			std::vector<long long> Parent;

			// Nodeに指定された頂点の根を返却
			unsigned long long root(unsigned long long Node) {
				if (Parent[Node] <= -1)
					return Node;

				// 経路圧縮
				return Parent[Node] = root(Parent[Node]);
			}
	};

	bool isPrime(unsigned long long n) {
		for (unsigned long long i = 2; i * i <= n; ++i) {
			if (n % i == 0) {
				return false;
			}
		}
		return true;
	}

	vector<unsigned long long> listDivisors(unsigned long long n) {
		vector<unsigned long long> ans;
		for (unsigned long long i = 1; i * i <= n; ++i) {
			if (n % i == 0) {
				if (n / i == i) ans.push_back(i);
				else {
					ans.push_back(i);
					ans.push_back(n / i);
				}
			}
		}
		return ans;
	}

	vector<pair<unsigned long long, unsigned long long>> primeFactor(unsigned long long n) {
		vector<pair<unsigned long long, unsigned long long>> ans;
		for (unsigned long long i = 2; i * i <= n; ++i) {
			if (n % i != 0) continue;
			unsigned long long ex = 0;
			while (n % i == 0) {
				++ex;
				n /= i;
			}
			ans.push_back({i, ex});
		}
		if (n != 1) ans.push_back({n, 1});
		return ans;
	}

}

using namespace kuonruri;
// }}}
int main() {
	
}
