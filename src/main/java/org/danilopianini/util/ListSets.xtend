package org.danilopianini.util

final class ListSets {
	
	static val ImmutableListSet<?> EMPTY = ImmutableListSet.newBuilder.build
	
	private new() {}
	
	def static <E> ListSet<E> unmodifiableListSet(ListSet<E> l) {
		new UnmodifiableListSet(l)
	}
	
	def static <E> ListSet<E> emptyListSet() {
		EMPTY as ListSet<E>
	}
	
}