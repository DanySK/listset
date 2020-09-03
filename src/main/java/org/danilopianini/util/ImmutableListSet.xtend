package org.danilopianini.util

import com.google.common.collect.ImmutableList
import org.eclipse.xtend.lib.annotations.Delegate

class ImmutableListSet<E> implements ListSet<E> {

    @Delegate val ImmutableList<E> base

    private new(ImmutableList<E> base) { this.base = base }

    def static <E> ImmutableListSet<E> of(E... elements) {
        new Builder().add(elements).build
    }

    def static <E> ImmutableListSet<E> copyOf(Iterable<? extends E> elements) {
        new Builder().addAll(elements).build
    }
    
    def static <E> Builder<E> newBuilder() {
        new Builder
    }

    override toString() {
        base.toString
    }
    
    override hashCode() {
        base.hashCode
    }
    
    override equals(Object o) {
        base.equals(o)
    }
    
    static class Builder<E> {
        val ListSet<E> contents = new LinkedListSet
        new() {}
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