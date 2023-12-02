// {{{
#include <bits/stdc++.h>
#include <atcoder/all>
#define rep(i, n) for (unsigned long long i = 0; i < (unsigned long long)(n); ++i)
using namespace std;
using namespace atcoder;
using uint = unsigned int;
using ll = long long;
using ull = unsigned long long;
using vi = vector<int>;
using vui = vector<unsigned int>;
using vl = vector<long long>;
using vu = vector<unsigned long long>;
using vc = vector<char>;
using vb = vector<bool>;
using vvi = vector<vector<int>>;
using vvl = vector<vector<long long>>;
using vvu = vector<vector<unsigned long long>>;
using vvui = vector<vector<unsigned int>>;
using vvc = vector<vector<char>>;
using vvb = vector<vector<bool>>;
using pii = pair<int, int>;
using pll = pair<long long, long long>;
using puu = pair<unsigned long long, unsigned long long>;
using mint = modint;
using m9int = modint998244353;
using m1int = modint1000000007;
const vector<int> ix = {0, -1, 0, 1};
const vector<int> iy = {-1, 0, 1, 0};
const char el = '\n';

namespace kuonruri {

	class Eratosthenes {

		public:

			Eratosthenes(unsigned int n = 10e7) : primeList(n + 1, true), minFactor(n + 1, 0) {
				primeList[1] = false;
				minFactor[1] = 1;

				for (unsigned int p = 2; p <= n; ++p) {
					if (!primeList[p]) continue;
					minFactor[p] = p;
					for (unsigned int q = p * 2; q <= n; q += p) {
						primeList[q] = false;
						if (minFactor[q] == 0) minFactor[q] = p;
					}
				}
			}

			bool isPrime(unsigned int n) {
				return primeList[n];
			}

			vector<unsigned int> listPrime(unsigned int n) {
				vector<unsigned int> ans;
				for (unsigned int i = 2; i <= n; ++i) {
					if (isPrime(i)) ans.push_back(i);
				}
				return ans;
			}

			vector<pair<unsigned int, unsigned int>> factorize(unsigned int n) {
				vector<pair<unsigned int, unsigned int>> res;
				while (n > 1) {
					unsigned int p = minFactor[n];
					unsigned int exp = 0;
					while (minFactor[n] == p) {
						n /= p;
						++exp;
					}
					res.emplace_back(p, exp);
				}
				return res;
			}

			vector<unsigned int> divisorts(unsigned int n) {
				vector<unsigned int> res({1});
				auto pf = factorize(n);
				for (auto p:pf) {
					unsigned int s = (unsigned int)res.size();
					for (unsigned int i = 0; i < s; ++i) {
						unsigned int v = 1;
						for (unsigned int j = 0; j < p.second; ++j) {
							v *= p.first;
							res.push_back(res[i] * v);
						}
					}
				}
				return res;
			}

		private:
			vector<bool> primeList;
			vector<unsigned int> minFactor;

	};

	bool primeCheck(unsigned long long n) {
		for (unsigned long long i = 2; i * i <= n; ++i) {
			if (n % i == 0) {
				return false;
			}
		}
		return true;
	}

	// 因数の一覧(root(N))
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

	// 素因数分解(root(N))
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


	// 最長部分増加列の長さ(Nlog(N))
	unsigned long long LISSolve(vector<unsigned long long> a) {
		vector<unsigned long long> index(a.size(), 0);
		unsigned long long ans = 1;
		index[0] = a[0];
		for (unsigned long long i = 1; i < a.size(); ++i) {
			auto it = lower_bound(index.begin(), next(index.begin(), ans), a[i]);
			if (it == index.begin()) {
				index[0] = a[i];
				continue;
			}
			unsigned long long ind = distance(index.begin(), it);
			ans = max(ans, ind + 1);
			if (index[ind] == 0) index[ind] = a[i];
			index[ind] = min(index[ind], a[i]);
		}
		return ans;
	}

	template <class T>
	class SumVec {
		public:
			SumVec(const vector<T>& init_vec) : sum_vec(init_vec.size() + 1, 0) {
				for (size_t i = 1; i < sum_vec.size(); ++i) sum_vec[i] = sum_vec[i - 1] + init_vec[i - 1];
			}

			T sum_range(size_t begin, size_t last) {
				return sum_vec[last + 1] - sum_vec[begin];
			}

		private:
			vector<T> sum_vec;
	};

	template <class T>
	class SumVecVec {
		public:
			SumVecVec(const vector<vector<T>>& init_vec) : sum_vec(init_vec.size() + 1, vector<T>(init_vec[0].size() + 1)) {
				for (size_t i = 1; i < sum_vec.size(); ++i) {
					for (size_t j = 1; j < sum_vec[0].size(); ++j) sum_vec[i][j] = sum_vec[i - 1][j] + init_vec[i - 1][j - 1];
				}
				for (size_t i = 1; i < sum_vec[0].size(); ++i) {
					for (size_t j = 1; j < sum_vec.size(); ++j) sum_vec[j][i] += sum_vec[j][i - 1];
				}
			}

			T sum_range(pair<size_t, size_t> begin, pair<size_t, size_t> last) {
				return sum_vec[last.first + 1][last.second + 1] - sum_vec[begin.first][last.second + 1]
					- sum_vec[last.first + 1][begin.second] + sum_vec[begin.first][begin.second];
			}

		private:
			vector<vector<T>> sum_vec;
	};

	class UnionFind {
		public:

			explicit UnionFind(size_t NodeCountSum) : Parent(NodeCountSum, -1) {}

			// NodeAとNodeBに指定された頂点が同じグループか判定
			bool connect(long long NodeA, long long NodeB) {
				return root(NodeA) == root(NodeB);
			}

			// NodeAとNodeBに指定された頂点を同じ頂点にする。
			void merge(long long NodeA,long long NodeB) {
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
			long long size(long long Node) {
				return -1 * Parent[root(Node)];
			}

		private:
			// -1で初期化
			// 根のときには -1 * そのグループの頂点数を保持
			// それ以外のときには、親の頂点を保持
			std::vector<long long> Parent;

			// Nodeに指定された頂点の根を返却
			unsigned long long root(long long Node) {
				if (Parent[Node] <= -1)
					return Node;

				// 経路圧縮
				return Parent[Node] = root(Parent[Node]);
			}
	};

}

using namespace kuonruri;
// }}}
int main() {
	
}
