package org.danilopianini.util

final class ListSets {
	
	private new() {}
	
	def static <E> unmodifiableListSet(ListSet<E> l) {
		new UnmodifiableListSet(l)
	}
	
}