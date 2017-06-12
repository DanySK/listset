package org.danilopianini.util

import com.google.common.collect.ImmutableList
import java.util.Collection

class ImmutableListSet<E> extends ListBackedSet<E> {

	private new(ImmutableList<E> base) {
		super(base)
	}

	def public static <E> of(E... elements) {
		new ImmutableListSet(ImmutableList.copyOf(new LinkedListSet(elements)))
	}

	def public static <E> copyOf(Collection<E> elements) {
		ImmutableListSet.of(elements.toArray)
	}

	def public static <E> copyOf(Iterable<E> elements) {
		ImmutableListSet.of(elements.toList)
	}

	public static class Builder<E> {
		val ListSet<E> contents = new LinkedListSet
		public new() {}
		def Builder<E> add(E... elements) {
			contents.addAll(elements)
			this
		}
		def Builder<E> add(E element) {
			contents.add(element)
			this
		}
		def Builder<E> addAll(Iterable<? extends E> elements) {
			contents.addAll(elements)
			this
		}
		def ImmutableListSet<E> build() {
			return new ImmutableListSet(ImmutableList.copyOf(contents))
		}
	}
	
}