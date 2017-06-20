package org.danilopianini.util

import java.util.stream.Collector
import java.util.stream.Collectors

final class ListSets {
	
	static val ImmutableListSet<?> EMPTY = ImmutableListSet.of
	
	private new() {}
	
	def static <E> ListSet<E> unmodifiableListSet(ListSet<E> l) {
		new UnmodifiableListSet(l)
	}
	
	def static <E> ListSet<E> emptyListSet() {
		EMPTY as ListSet<E>
	}

	def static <T> Collector<T, ?, ListSet<T>> toArrayListSet() {
		Collectors.toCollection[new ArrayListSet]
	}

	def static <T> Collector<T, ?, ListSet<T>> toLinkedListSet() {
		Collectors.toCollection[new LinkedListSet]
	}

}