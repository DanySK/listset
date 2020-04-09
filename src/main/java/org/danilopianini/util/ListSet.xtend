package org.danilopianini.util

import java.util.Set
import java.util.List
import java.util.Collection
import java.io.Serializable

/**
 * This interface represents an ordered set (or a list without duplicates). It is the reification of the Java intersection type:
 * 
 * List<E> & Set<E>
 * 
 * The default method spliterator() is inherited from List.
 */
interface ListSet<E> extends Set<E>, List<E>, Serializable {

	override spliterator() {
		List.super.spliterator()
	}
	
	def boolean setEquals(Set<?> other) {
		other !== null && size == other.size && containsAll(other)
	}

	static def <E> ListSet<E> copyOf(Collection<? extends E> e) {
	    ImmutableListSet.copyOf(e as Iterable<? extends E>)
	}

	static def <E> ListSet<E> of() {
	    ListSets.emptyListSet()
	}

	static def <E> ListSet<E> of(E[] e) {
	    ImmutableListSet.of(e)
	}

	static def <E> ListSet<E> of(E e) {
	    ImmutableListSet.of(e)
	}

	static def <E> ListSet<E> of(E e1, E e2) {
	    ImmutableListSet.of(e1, e2)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3) {
	    ImmutableListSet.of(e1, e2, e3)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4) {
	    ImmutableListSet.of(e1, e2, e3, e4)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5, E e6) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5, e6)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5, e6, e7)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5, e6, e7, e8)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5, e6, e7, e8, e9)
	}

	static def <E> ListSet<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9, E e10) {
	    ImmutableListSet.of(e1, e2, e3, e4, e5, e6, e7, e8, e9, e10)
	}


}